package com.lcpoletto.notes.model;

import java.io.Serializable;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBAutoGeneratedKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBHashKey;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBIgnore;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBTable;

/**
 * This class represent one note to be persisted on dynamodb table.
 * 
 * @author Luis Carlos Poletto
 *
 */
@DynamoDBTable(tableName = "notes")
public class Note implements Serializable {

    private static final long serialVersionUID = 6825546845788355299L;

    @DynamoDBHashKey
    @DynamoDBAutoGeneratedKey
    private String id;
    private String owner;
    private String recipient;
    private Boolean allowChange;
    private String content;
    private String updatedBy;
    @DynamoDBIgnore
    private String resourceUri;

    /**
     * Overriding default toString for logging purposes, using a json-like
     * representation.
     */
    @Override
    public String toString() {
        final StringBuilder result = new StringBuilder();
        result.append("{ \"id\": \"");
        result.append(id);
        result.append("\", \"owner\": \"");
        result.append(owner);
        result.append("\", \"recipient\": \"");
        result.append(recipient);
        result.append("\", \"allowChange\": \"");
        result.append(allowChange);
        result.append("\", \"content\": \"");
        result.append(content);
        result.append("\", \"updatedBy\": \"");
        result.append(updatedBy);
        result.append("\" }");
        return result.toString();
    }

    /**
     * Getter for id.
     * 
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * Setter for id.
     * 
     * @param id
     *            the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Getter for owner.
     * 
     * @return the owner
     */
    public String getOwner() {
        return owner;
    }

    /**
     * Setter for owner.
     * 
     * @param owner
     *            the owner to set
     */
    public void setOwner(String owner) {
        this.owner = owner;
    }

    /**
     * Getter for recipient.
     * 
     * @return the recipient
     */
    public String getRecipient() {
        return recipient;
    }

    /**
     * Setter for recipient.
     * 
     * @param recipient
     *            the recipient to set
     */
    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    /**
     * Getter for allowChange.
     * 
     * @return the allowChange
     */
    public Boolean getAllowChange() {
        return allowChange;
    }

    /**
     * Setter for allowChange.
     * 
     * @param allowChange
     *            the allowChange to set
     */
    public void setAllowChange(Boolean allowChange) {
        this.allowChange = allowChange;
    }

    /**
     * Getter for content.
     * 
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * Setter for content.
     * 
     * @param content
     *            the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Getter for updatedBy.
     * 
     * @return the updatedBy
     */
    public String getUpdatedBy() {
        return updatedBy;
    }

    /**
     * Setter for updatedBy.
     * 
     * @param updatedBy
     *            the updatedBy to set
     */
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    /**
     * Getter for resourceUri.
     *
     * @return the resourceUri
     */
    public String getResourceUri() {
        return resourceUri;
    }

    /**
     * Setter for resourceUri.
     *
     * @param resourceUri
     *            the resourceUri to set
     */
    public void setResourceUri(String resourceUri) {
        this.resourceUri = resourceUri;
    }

}
